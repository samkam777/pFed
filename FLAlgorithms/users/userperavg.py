import torch
import copy
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
import os
import json
from torch.utils.data import DataLoader
from FLAlgorithms.optimizers.fedoptimizer import MySGD
from FLAlgorithms.users.userbase import User

class UserPerAvg(User):
    def __init__(self, device, args, model, train_data, test_data, train_data_samples, numeric_id):
        super().__init__(device, args, model, train_data, test_data, train_data_samples, numeric_id)
        self.total_users = args.seg_data

        self.loss = nn.BCELoss()
        self.optimizerSGD = MySGD(self.model.parameters(), lr=self.learning_rate)
        self.optimizerAdam = optim.Adam(self.model.parameters(), lr=self.learning_rate)

    def set_grads(self, new_grads):
        if isinstance(new_grads, nn.Parameter):
            for model_grad, new_grad in zip(self.model.parameters(), new_grads):
                model_grad.data = new_grad.data
        elif isinstance(new_grads, list):
            for idx, model_grad in enumerate(self.model.parameters()):
                model_grad.data = new_grads[idx]

    def train(self, epochs):

        self.model.train()
        losses = []
        for epoch in range(1, self.local_epochs + 1):  # local update 
            self.model.train()

            temp_model = copy.deepcopy(list(self.model.parameters()))

            #step 1
            user, item, label = self.get_next_train_batch()
            self.optimizerAdam.zero_grad()
            prediction = self.model(user, item)
            loss = self.loss(prediction, label)
            loss.backward()
            self.optimizerAdam.step()       # 论文算法1中第9行

            #step 2
            user, item, label = self.get_next_train_batch()  # 下一个minibatch
            self.optimizerSGD.zero_grad()
            prediction = self.model(user, item)
            loss = self.loss(prediction, label)
            loss.backward()

            # loss
            losses.append(loss.item())

            # restore the model parameters to the one before first update
            for old_p, new_p in zip(self.model.parameters(), temp_model):
                old_p.data = new_p.data.clone()

            self.optimizerSGD.step(beta = self.beta)   # 论文算法1中第10行

            # clone model to user model 是将更新后的model克隆到local model
            self.clone_model_paramenter(self.model.parameters(), self.local_model)
        
        train_loss = sum(losses) / len(losses)

        print("training epochs {} client {}  loss: {:.4f} \t".format(epochs, self.id, train_loss))

        return train_loss


    def train_one_step(self):
        self.model.train()
        #step 1
        user, item, label = self.get_next_test_batch()
        self.optimizerAdam.zero_grad()
        prediction = self.model(user, item)
        loss = self.loss(prediction, label)
        loss.backward()
        self.optimizerAdam.step()
        #step 2
        user, item, label = self.get_next_test_batch()
        self.optimizerSGD.zero_grad()
        prediction = self.model(user, item)
        loss = self.loss(prediction, label)
        loss.backward()
        self.optimizerSGD.step(beta=self.beta)




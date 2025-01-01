# Chatbot with Amazon Lex & AWS Lambda

### Overview

Tis project will utilizing 2 services, Amazon Lex and AWS Lambda. Amazon Lex is use to create a chatbot while Lambda will run a code to provide user with the output after the intent is fulfill.


### 1. Setting up a Lex chatbot

I created my chatbot from scratch with Amazon Lex. Setting it up took me about 3 minutes.

While creating my chatbot, I also created a role with basic permissions because Amazon Lex will require this permission to call a lambda function later

In terms of the intent classification confidence score, I kept the default value of 0.40. This means that the minimum amount of chatbot to understand the request from user is 40%.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/chatbot/language-to-bot.PNG?raw=true)

- Intent

Intents are what user trying to achieve by interacting with the chat bot. For example checking flight status, bank account balance and etc

I created my first intent, WelcomeIntent, to greet user when they say hello.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/chatbot/1st-conversation.PNG?raw=true)

- FallbackIntent

I launched and tested my chatbot, which could respond successfully if I enter Hi, Hello, Help me, Hiya

My chatbot returned the error message 'Intent FallbackIntent is fulfilled' when I entered Good Morning, How are you. This error message occurred because the Amazon Lex does not recognize the utterance

- Configuring FallbackIntent

FallbackIntent is a default intent in every chatbot that gets triggered when the confident score is below than the minimum threshold. For this project is 0.4 or 40%.

I wanted to configure FallbackIntent because this is the way that chat bot will tell user that it does not understand the request.

- Variations

To configure FallbackIntent, I click at FallbackIntent at the left navigation panel and scroll down to Response sent to the user after the intent is fulfilled section. Add the Sorry statement in the message.

I also added variations! What this means for an end user is that if the chat bot do not understand, it will also give another response.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/chatbot/fallback-intent.PNG?raw=true)

### 2. Adding Slots

Slots are the details that chatbot require to complete the user request. These include date, location, place or any other details that are relevant for the request. Slots can be custom or can be ready-to-use which are available for common info.

By adding custom slots in utterances, my chatbot's users will input a necesary information for the chatbot to complete the request. The chatbot will only provide the correct response if user input a relevant information.

In this project, I created a custom slot type to complete a user request.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/chatbot/SlotType.PNG?raw=true)

### 3. Connecting slots with intents 

This slot type has restricted slot values, which means the chatbot will be using only the specific slot value specified by me.

I associated my custom slot with CheckBalance, which is accountType and dateofBirth because I wanted to get user input to get more information to complete the request

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/chatbot/intentSlot.PNG?raw=true)


- Slot values in utterances

I included slot values in some of the utterances (i.e. user inputs) by scrolling down to slots section, add slots and proceed to save the intent and build the chatbot. For example'Slot name dateOfBirth and Slot type AMAZON.Date.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/chatbot/testintentslot.PNG?raw=true)


### 4. AWS Lambda Functions

AWS Lambda is a service that allow code to be run without provisioning a server. Lambda will run the code when needed and automatically scale based on request.

In this project, I created a Lambda function to generate a random number when user ask the account balance.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/chatbot/lambdacode.PNG?raw=true)

### 5. Chatbot Alias

An alias is a pointer for specific version. This will allow external service to associate with the chatbot alias which will point to the specific chatbot version. So without connecting directly to specific version, it reduce risk of errors.

TestBotAlias is a default version of bot for testing and development. A playground before rolling out the changes. To connect Lambda with my BankerBot, I visited my bot's TestBotAlias and select the language. The lambda function panel will automatically appear.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/chatbot/associatelambda.PNG?raw=true)

### 6. Code Hooks

A code hook is allowing the Amazon Lex to connect to a custom Lambda function for doing a specific task during a conversation.

Even though I already connected my Lambda function with my chatbot's alias, I had to use code hooks because it allow me to perform task during the chat. After the check balance is fulfill.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/chatbot/associateintentwithlambda.PNG?raw=true)

### 7. Success!

I've set up my chatbot to trigger Lambda and return a random dollar figure when the CheckBalance intent is fulfill. This means after user provided all the necessary informations/slots that I predefined earlier.

![alt text](https://github.com/hanifyaziz/AWS-Projects/blob/main/screenshot/chatbot/bankbalance.PNG?raw=true)



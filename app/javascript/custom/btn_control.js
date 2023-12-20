// app/javascript/chat.js

document.addEventListener('turbolinks:load', function() {
  const messageForm = document.getElementById('message-form');
  const messageContent = document.getElementById('message_content');
  const sendButton = document.getElementById('send-button');

  messageContent.addEventListener('keyup', function() {
    sendButton.disabled = this.value.trim().length === 0;
  });
});

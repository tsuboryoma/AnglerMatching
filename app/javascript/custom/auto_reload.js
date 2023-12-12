document.addEventListener("DOMContentLoaded", function() {
  var messagesContainer = document.getElementById('messages');
  console.log(messagesContainer); // 確認のためコンソールに出力
  if (messagesContainer) {
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
  }
});
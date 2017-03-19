(function() {
  App.room = App.cable.subscriptions.create("NotificationChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      console.log(data);
    }
  });
}).call(this);


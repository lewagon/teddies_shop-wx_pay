(function() {
  App.room = App.cable.subscriptions.create("NotificationChannel", {
    received: function(data) {
      console.log(data);
    }
  });
}).call(this);


(function() {
  App.room = App.cable.subscriptions.create("NotificationChannel", {
    received: function(data) {
      console.log(data);
      switch(data["shop_event"]) {
        case "order_paid":
          window.location.href = "/orders/" + data["order_id"];
          break;
      }
    }
  });
}).call(this);

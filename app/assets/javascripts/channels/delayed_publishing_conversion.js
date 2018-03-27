App.delayed_publishing = App.cable.subscriptions.create("DelayedPublishingChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    if (window.confirm(data.message)) { 
      window.location.href = window.location.origin;
    }
  }
});

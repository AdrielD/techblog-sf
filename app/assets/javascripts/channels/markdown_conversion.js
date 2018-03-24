App.markdown_conversion = App.cable.subscriptions.create("MarkdownConversionChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    var channel_event = new CustomEvent("markdown_conversion_channel", { detail: data['message'] });
    document.dispatchEvent(channel_event);
  },

  convert: function(text) {
    return this.perform('convert', { message: text });
  }
});

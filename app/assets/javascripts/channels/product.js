App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    console.log('ready');
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
    console.log('disconnected');
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".alert.alert-info").show();
    console.log(data);
    $('.product-reviews').prepend(data.comment);
    refreshRating();
  },

  listen_to_comments: function() {
    return this.perform('listen', {
      product_id: $("[data-product-id]").data("product-id")
    });
    console.log('this', this)
}

});

$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();
  console.log('listen_to_comments')
});

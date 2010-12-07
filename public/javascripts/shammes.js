$(document).ready( function() {  
  $.ajax({ url: '/hit/push',
          data: { hit: { url: document.URL } },
          type: 'GET',
          success: function(data) {
            console.log("Suceeded: ", data);
          }
  });
});

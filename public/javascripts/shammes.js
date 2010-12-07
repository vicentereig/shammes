$(document).ready( function() {  
  $.ajax({ url: 'http://radiant-earth-22.heroku.com/hit/push',
          data: { hit: { url: document.URL } },
          type: 'GET',
          success: function(data) {
            //console.log("Suceeded: ", data);
          }
  });
});

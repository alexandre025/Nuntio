App.ready(function(){

  $('.tower-card').find('.rating-stars').each(function(){
        var elem = this;
        var rating = $(elem).data('rating');

        $(elem).rateYo({
            readOnly: true,
            numStars: 5,
            rating: rating,
            maxValue: 5,
            spacing: '1px',
            normalFill: '#DBDBDB',
            ratedFill: '#29339E',
            starWidth: '12px'
        });

    });

    $('.report-container__content').find('.rating-stars').each(function(){
          var elem = this;
          var rating = $(elem).data('rating');

          $(elem).rateYo({
              numStars: 5,
              maxValue: 5,
              spacing: '2px',
              normalFill: '#DBDBDB',
              ratedFill: '#29339E',
              starWidth: '26px',
              fullStar: true
          });

      });

});

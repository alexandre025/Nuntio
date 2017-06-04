App.ready(function(){

  // TOWER CARD & REPORT CARD
  $('.tower-card, .report-card').find('.rating-stars').each(function(){
        var elem = this;
        var rating = Math.round(2.3/0.5) * 0.5;

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

    // TOWER SHOW
    $('.tower-show__header--content').find('.rating-stars').each(function(){
        var elem = this;
        var rating = Math.round(2.3/0.5) * 0.5;

        $(elem).rateYo({
            readOnly: true,
            numStars: 5,
            rating: rating,
            maxValue: 5,
            spacing: '1px',
            normalFill: '#7C7C7C',
            ratedFill: '#FFFFFF',
            starWidth: '13px'
        });

    });

    $('.tower-show__content--side').find('.rating-stars').each(function(){
      var elem = this;
      var rating = Math.round(2.3/0.5) * 0.5;

      $(elem).rateYo({
          readOnly: true,
          numStars: 5,
          rating: rating,
          maxValue: 5,
          spacing: '1px',
          normalFill: '#DBDBDB',
          ratedFill: '#29339E',
          starWidth: '20px'
      });

    });

    $('.tower-show__header--content').find('.rating-stars').each(function(){
          var elem = this;
          var rating = Math.round(2.3/0.5) * 0.5;

          $(elem).rateYo({
              readOnly: true,
              numStars: 5,
              rating: rating,
              maxValue: 5,
              spacing: '1px',
              normalFill: '#7C7C7C',
              ratedFill: '#FFFFFF',
              starWidth: '13px'
          });

      });

    // REPORT SHOW
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

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
            normalFill: '#C6C6C6',
            ratedFill: '#FFDE01',
            starWidth: '12px'
        });

    });

});

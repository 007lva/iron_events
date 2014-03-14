$(document).ready(function(){
    $('#search').autocomplete(
        { 
            source: '/events/search',
            minLength: 1   
        }
    )
});

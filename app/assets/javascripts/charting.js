var chart1; // globally available
$(document).ready(function() {

    // console.log(window.location.pathname);

    var options = {
        chart: {
          renderTo: 'chart'
          // defaultSeriesType: 'column'
        },
        title: {
          text: 'Monthly Expenses'
        },
        xAxis: {
          categories: []
        },
        yAxis: {
          title: {
              text: '$'
          }
        },
        series: []
      };

      

      $.ajax({
          url: window.location.pathname, 
          dataType: 'json',
          success: function(json){
            $.each(json['1'], function(index, expense){
                console.log(expense);
            });
          }



      });









  













      // chart1 = new Highcharts.Chart({
      //    chart: {
      //       renderTo: 'chart',
      //       type: 'column '
      //    },
      //    title: {
      //       text: 'Fruit Consumption'
      //    },
      //    xAxis: {
      //       categories: ['Apples', 'Bananas', 'Oranges']
      //    },
      //    yAxis: {
      //       title: {
      //          text: 'Fruit eaten'
      //       }
      //    },
      //    series: [{
      //       name: 'Jane',
      //       data: [1, 0, 4]
      //    }, {
      //       name: 'John',
      //       data: [5, 7, 3]
      //    }]
      // });
   });
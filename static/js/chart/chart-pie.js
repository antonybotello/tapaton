// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example
var ctx = document.getElementById("tapas-grupos");
var myLineChart = new Chart(ctx, {
  type: 'polarArea',
  data: {
    labels:$('#tags-pie').html().slice(0,-1).split(','),
    datasets: [
      {
        label: 'Dataset 1',
        data: $('#data-pie').html().slice(13,-2).split(','),
        backgroundColor: ["rgba(255,0,0,0.5)",'rgba(0,0,255,0.5)', 'rgba(255,255,0,0.5)', 'rgba(0,255,0,0.5)','rgba(100,0,255,0.5)'],
      }
    ]
  },
  options: {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
      },
      title: {
        display: true,
        text: 'Chart.js Doughnut Chart'
      }
    }
  },
});

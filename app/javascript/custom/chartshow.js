document.addEventListener("DOMContentLoaded", function () {
    var ctx = document.getElementById('histogramChart');

    if (ctx) { // Ensure the element exists before running the script
        var histogramData = JSON.parse(ctx.dataset.histogram); // Get data from dataset

        var chart = new Chart(ctx.getContext('2d'), {
            type: 'bar',
            data: {
                labels: Array.from({ length: 256 }, (_, i) => i.toString()), // Intensity levels 0-255
                datasets: [{
                    label: 'Pixel Intensity Distribution',
                    data: histogramData,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }
});
// Chart 1
const ctx1 = document.getElementById('chart1_1').getContext('2d');
const chart1 = new Chart(ctx1, {
    type: 'bar',
    data: {
        labels: ['January', 'February', 'March'],
        datasets: [{
            label: 'Sales',
            data: [12, 19, 3],
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
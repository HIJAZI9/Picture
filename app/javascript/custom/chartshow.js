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
                responsive: true, // Makes the chart adjust to screen size
                maintainAspectRatio: false, // Allows custom height & width
                plugins: {
                    title: {
                        display: true,       // Show the title
                        text: 'Histogram of Black and White Image',     // The title text
                        position: 'bottom',  // Place the title at the bottom
                        padding: {
                            top: 10,         // Space between the chart and the title
                            bottom: 0
                        },
                        font: {
                            size: 10
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            autoSkip: true, // Skips labels when necessary
                            maxRotation: 0, // Prevents rotation
                            minRotation: 0  // Forces labels to stay horizontal
                        }
                    }
                }
            }
        });
    }
});
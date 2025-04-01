document.addEventListener('DOMContentLoaded', function () {
    // Get the canvas element where the scatter plot will be drawn
    const canvas = document.getElementById('rgbScatterPlot');

    // Check if the canvas exists and if it has the required dataset attributes
    if (!canvas || !canvas.dataset.red || !canvas.dataset.green || !canvas.dataset.blue) {
        console.error("No scatter plot data found."); // Log an error if data is missing
        return; // Stop execution if there's no valid data
    }

    // Parse data from the dataset
    const redData = JSON.parse(canvas.dataset.red);
    const greenData = JSON.parse(canvas.dataset.green);
    const blueData = JSON.parse(canvas.dataset.blue);

    const ctx = canvas.getContext('2d');

    new Chart(ctx, {
        type: 'scatter',
        data: {
            datasets: [
                {
                    label: 'Red Channel',                       // Label for the red dataset
                    data: redData,                              // Assign parsed red channel data
                    backgroundColor: 'rgba(255, 99, 132, 0.6)', // Semi-transparent red
                    borderColor: 'rgba(255, 99, 132, 1)',       // Solid red border
                    pointRadius: 3                              // Set the size of each point
                },
                {
                    label: 'Green Channel',                     // Label for the green dataset
                    data: greenData,                            // Assign parsed green channel data
                    backgroundColor: 'rgba(75, 192, 192, 0.6)', // Semi-transparent green
                    borderColor: 'rgba(75, 192, 192, 1)',       // Solid green border
                    pointRadius: 3                              // Set the size of each point
                },
                {
                    label: 'Blue Channel',                      // Label for the blue dataset
                    data: blueData,                             // Assign parsed blue channel data
                    backgroundColor: 'rgba(54, 162, 235, 0.6)', // Semi-transparent blue
                    borderColor: 'rgba(54, 162, 235, 1)',       // Solid blue border
                    pointRadius: 3                              // Set the size of each point
                }
            ]
        },
        options: {
            scales: {
                x: {
                    title: {
                        display: true,
                        text: 'Pixel Position (X)'      // Label for X-axis
                    }
                },
                y: {
                    title: {
                        display: true,
                        text: 'Color Intensity (0-255)' // Label for Y-axis
                    },
                    min: 0,  // Set minimum intensity value
                    max: 255 // Set maximum intensity value
                }
            }
        }
    });
});

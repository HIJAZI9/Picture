# Picture
Image processing web application with Ruby on Rails
# 📊 Project Requirments

The objective is to develop a simple web application using Ruby on Rails that enables users to upload, process, and visually display images. 
The application should feature a homepage with a welcoming greeting message and allow users to upload images (one image is sufficient). After uploading, 
the image should be displayed in a resized version, with two variants: one in color and one in black and white.
Additionally, the application should generate a histogram for the black-and-white image using a JavaScript library like Chart.js, or alternatively,
create a creative visual representation such as a scatter plot of color values or a heatmap.
The user interface should be intuitive, and users should be able to restart the process without reloading the page, 
ensuring a smooth experience.

To find the given Documentation in german language open Docs then Aufgabe_mohammed_pictrs.pdf 


# 🛠️ System Dependencies

For this System to run, the following software should be installed:
### 📌 Required versions:
- **Ruby** 3.2.0
- **Rails** 8.0.2

> **Note:**  
> Although the Rails guide recommends using the **ASDF** version manager, our project uses **RVM** (Ruby Version Manager) to manage Ruby versions.  
> While **ASDF** is gaining popularity and surpassing other version managers like **rbenv** and **RVM**, we have chosen **RVM** for its flexibility and compatibility with our setup.


# 🚀 Run Locally

To run this project on your local machine, follow the steps below:

* First, clone the repository to your local machine
* Install Gems `bundle install`
* Set Up the Database `rails db:create > rails db:migrate` 
* Finally, run the Rails server and visit http://localhost:3000 in your browser to see the application running locally. `rails s`


# ⚙️ Implementation Process
1- This project is designed to be run in a development environment. Once the project is up and running, the first page you encounter will be the user Home page (welcome page).
In this Page you will be able to Select just an image to upload. The Uploaded Image should be (JPG, JPEG, GIF, or PNG only and less than 20.megabyte). Anything without that will show a flash error message stating that the chosen item could not be uploaded.



<div style="display: flex; justify-content: space-between; align-items: center;">
<img width="948" alt="home_page" src="https://github.com/user-attachments/assets/802f4934-5873-4413-8c30-8707d4bae060" />
</div>

2- After you click the 'Upload Image' button, you will see a new show page displaying a resized version of the image, with two variants: one in color and one in black and white.

    version :thumb do
    process resize_to_fit: [300, 300]
    end

    version :black_and_white do
    process :convert_to_black_and_white
    process resize_to_limit: [300, 300]  
    end

<div style="display: flex; justify-content: space-between; align-items: center;">
<img width="948" alt="display_image" src="https://github.com/user-attachments/assets/5ac5abaf-ebed-4754-b3e5-1cca4249a427" />
</div>

3- Data visualization: The Black and White Image Histogram and the Color Values Scatter Diagram are displayed as charts using Chart.js.
- Histogram of Black and White Image
<div style="display: flex; justify-content: space-between; align-items: center;">
<img width="941" alt="histogram_of_black_and_white_image" src="https://github.com/user-attachments/assets/6b43482e-9b30-4e58-8f28-8208cf4bba72" />
</div>

-  Scatter diagram of color values
<div style="display: flex; justify-content: space-between; align-items: center;">
<img width="941" alt="Scatter_diagram_of_color_values" src="https://github.com/user-attachments/assets/a12c63b4-21eb-4a26-bb25-a3ee933de4f3" />
</div>

4- User-Friendliness: 
- At the end of the Image Processing page (show_page), the user can click on the 'Upload Another Image' button, allowing them to restart the process without reloading the page. This will take the user back to the home page, where they can upload a new image.
- Image processing web application is Responsive and easy to use.

<div style="display: flex; justify-content: space-between; align-items: center;">
<img width="1239" alt="Upload_again_button" src="https://github.com/user-attachments/assets/97fa5a46-2d12-4f97-ad7e-90ed2d8fffbf" />
</div>

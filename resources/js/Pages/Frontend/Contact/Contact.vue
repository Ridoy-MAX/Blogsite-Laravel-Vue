<script setup>
import { reactive } from 'vue';
import { Head, Link } from '@inertiajs/vue3';
import './Contact.css';

// Reactive form data object
const formData = reactive({
  fullName: '',
  email: '',
  subject: '',
  message: ''
});

// Handle form submission
function handleSubmit(e) {
  e.preventDefault();
  console.log('Form submitted:', formData);

  // Add your form submission logic here (e.g., send the data to a backend)
}

// Handle form data change
function handleChange(event) {
  const { name, value } = event.target;
  formData[name] = value;
}
</script>

<template>
  <Head title="Welcome" />
  <div class="container mt-3" id="contact">
    <div class="contact">
      <div class="">
        <div class="row">
        
          <div class="">
            <div class="row">
              <div class="col-md-8">
                <div class="contact_left">
                  <h1 class='mb-3'>Contact</h1>
                  <form class="from" @submit="handleSubmit">
                    <div class="from_control">
                      <p>Full Name</p>
                      <div class="input">
                        <input 
                          type="text" 
                          id="fullName" 
                          name="fullName"
                          v-model="formData.fullName"
                          required 
                        />
                      </div>
                    </div>
                    <div class="from_control">
                      <p>Email address</p>
                      <div class="input">
                        <input 
                          type="email" 
                          id="email" 
                          name="email"
                          v-model="formData.email"
                          required 
                        />
                      </div>
                    </div>
                    <div class="from_control">
                      <p>Subject</p>
                      <div class="input">
                        <input 
                          type="text" 
                          id="subject" 
                          name="subject"
                          v-model="formData.subject"
                          required 
                        />
                      </div>
                    </div>
                    <div class="from_control">
                      <p>Message</p>
                      <div class="input">
                        <textarea 
                          id="message" 
                          name="message"
                          rows="3" 
                          v-model="formData.message"
                          required 
                        ></textarea>
                      </div>
                    </div>
                    <button type="submit" class="send">
                      <h6 class='mb-0'>Send</h6>
                    </button>
                  </form>
                </div>
              </div>
              <div class="col-md-4">
                <div class="contact_right">
                  <div class='mt-5'>
                    <div class="social_link">
                      <div class="one"></div>
                      <div class="two">
                        <div class="icon_box">
                          <div class="icon">
                            <a href=""><i class="fa-solid fa-envelope"></i></a>
                          </div>
                          <a>pou4w98y@gmail.com</a>
                        </div>
                        <div class="icon_box">
                          <div class="icon">
                            <a href=""><i class="fa-solid fa-phone-volume"></i></a>
                          </div>
                          <a>+8801717311750</a>
                        </div>
                        <div class="icon_box">
                          <div class="icon">
                            <a href=""><i class="fa-solid fa-location-dot"></i></a>
                          </div>
                          <a>Mohammadpur, Dhaka</a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
/* You can customize your styles here or use the imported Contact.css file */
</style>

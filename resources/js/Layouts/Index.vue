<!-- resources/js/Layouts/AppLayout.vue -->
<script setup>
import { ref } from 'vue';
import { Link } from '@inertiajs/vue3';
import './Navbar.css';

// Access shared props
defineProps(['auth', 'canLogin', 'canRegister', 'laravelVersion', 'phpVersion']);

// Handle menu toggle
const menuOpen = ref(false);

function handleMenuToggle() {
    menuOpen.value = !menuOpen.value;
}

const scrolled = ref(false);

function handleScroll() {
    scrolled.value = window.scrollY > 50;
}


// window.addEventListener('scroll', handleScroll);
</script>

<template>
    <div>
        <header class="container">
            <div>
                <header :class="['header', { 'scrolledNavbar': scrolled }]">
                    <Link
                       :href="route('home')"
                        class="logo_email_link_m">
                    <div class="logo_email">
                        <i class="fa-solid fa-icons"></i>
                    </div>
                    </Link>


                    <i class="fa-solid fa-bars menuToggle" @click="handleMenuToggle"></i>

                    <nav :class="['nav', { 'show': menuOpen }]">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="m-auto">
                                    <div class="menu">
                                        <a class="close">
                                            <i class="fa-solid fa-xmark" @click="handleMenuToggle"></i>
                                        </a>

                                        <div class="d-flex justify-content-center">
                                            <Link
                                                  :href="route('home')"
                                              rel="noopener noreferrer" class="logo_email_link">
                                            <div class="logo_email">
                                                <i class="fa-solid fa-icons"></i>
                                            </div>
                                            </Link>
                                        </div>

                                        <div class="nav_item mt-3">
                                            <ul class="list">
                                                <li class="menu_item_has_children">
                                                    <Link :href="route('home')" class="button_primary_none"
                                                        @click="handleMenuToggle">
                                                    <p>Home</p>
                                                    </Link>
                                                </li>
                                                <li>
                                                    <Link href="/#blog" class="button_primary_none"
                                                        @click="handleMenuToggle">
                                                    <p>Blog</p>
                                                    </Link>
                                                </li>
                                                <li>
                                                    <Link href="/#about" class="button_primary_none"
                                                        @click="handleMenuToggle">
                                                    <p>About</p>
                                                    </Link>
                                                </li>
                                                <li>
                                                    <Link href="/#contact" class="button_primary_none"
                                                        @click="handleMenuToggle">
                                                    <p>Contact</p>
                                                    </Link>
                                                </li>
                                            
                                                <div >

                                                    <nav v-if="canLogin" >
                                                        <li v-if="auth.user">
                                                            <!-- Dashboard link when the user is authenticated -->
                                                            <Link :href="route('dashboard')" class="button_primary">Dashboard</Link>
                                                        </li>
                                                        <li v-else>
                                                            <!-- Login and Register links when the user is not authenticated -->
                                                            <Link :href="route('login')" class=" button_primary"> Log in</Link>
                                                            <Link v-if="canRegister" :href="route('register')" class=" button_primary ms-2">Register</Link>
                                                        </li>
                                                    </nav>




                                                </div>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </nav>
                </header>
            </div>


        </header>

        <!-- Main content -->
        <main>
            <slot :auth="auth" :can-login="canLogin" :can-register="canRegister" :laravel-version="laravelVersion"
                :php-version="phpVersion"></slot>
        </main>

        <footer class="container">
            <p class="text-center">© My Blog, Inc. {{ laravelVersion }} </p>
        </footer>
    </div>
</template>

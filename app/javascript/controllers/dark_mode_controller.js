import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "theme_toggle_dark_icon", "theme_toggle_light_icon"
  ]
  connect() {
    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      document.documentElement.classList.add('dark');
      this.theme_toggle_light_iconTarget.classList.remove('hidden');
    } else {
      document.documentElement.classList.remove('dark')
      this.theme_toggle_dark_iconTarget.classList.remove('hidden');
    }
  }

  toggleTheme(event) {
    event.preventDefault();
    this.theme_toggle_dark_iconTarget.classList.toggle('hidden');
    this.theme_toggle_light_iconTarget.classList.toggle('hidden');

    if (localStorage.getItem('color-theme')) {
      if (localStorage.getItem('color-theme') === 'light') {
        document.documentElement.classList.add('dark');
        localStorage.setItem('color-theme', 'dark');
      } else {
        document.documentElement.classList.remove('dark');
        localStorage.setItem('color-theme', 'light');
      }

      // if NOT set via local storage previously
    } else {
      if (document.documentElement.classList.contains('dark')) {
        document.documentElement.classList.remove('dark');
        localStorage.setItem('color-theme', 'light');
      } else {
        document.documentElement.classList.add('dark');
        localStorage.setItem('color-theme', 'dark');
      }
    }
  }
}
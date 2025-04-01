import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    document.getElementById("toast-audio").click();
    document.addEventListener("click", this.enableSound, { once: true });
    this.removeToast();
  }

  enableSound = () => {
    document.userInteracted = true; // Mark page as interacted
    this.playSound();
  };

  playSound() {
    const audio = document.getElementById("toast-audio");
    if (audio) {
      audio.play().catch((error) => console.warn("Audio play blocked:", error));
    }
  }

  removeToast() {
    setTimeout(() => {
      document.getElementById("toast-partial").replaceChildren();
    }, 3000);
  }
}

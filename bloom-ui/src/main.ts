import App from './App.svelte';

// Compute --ui-scale (ADR-002) BEFORE mounting so first paint already scaled.
function updateUiScale() {
  const scaleX = window.innerWidth / 1366;
  const scaleY = window.innerHeight / 768;
  const scale = Math.min(scaleX, scaleY);
  document.documentElement.style.setProperty('--ui-scale', String(scale));
}
updateUiScale();
window.addEventListener('resize', updateUiScale);

const target = document.getElementById('app');
if (!target) throw new Error('App root #app not found');

const app = new App({ target });

export default app;

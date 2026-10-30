<script lang="ts">
  import logoStacked from './assets/brand/logo-stacked.svg';
  import logoIntro from './assets/brand/animated/logo-bloom-intro.svg';
</script>

<main class="splash">
  <div class="halo"></div>
  <object class="intro-logo" data={logoIntro} type="image/svg+xml" aria-label="Bloom intro"></object>
  <p class="tagline">Where every story blooms. 🌸</p>
  <p class="status">
    <span class="dot"></span>
    bloom-ui v0.0.0 · Vite + Svelte 4 + TypeScript · siap dibangun
  </p>
</main>

<style>
  .splash {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 1rem;
    position: relative;
    overflow: hidden;
    background:
      radial-gradient(circle at 15% 20%, rgba(255, 183, 213, 0.3) 0 20rem, transparent 20rem),
      radial-gradient(circle at 85% 80%, rgba(200, 168, 233, 0.3) 0 22rem, transparent 22rem),
      var(--bloom-cream-50);
  }
  .halo {
    position: absolute;
    width: 30rem;
    height: 30rem;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(255,232,168,0.4), transparent 70%);
    filter: blur(2rem);
    animation: pulse 4s ease-in-out infinite;
  }
  @keyframes pulse {
    0%, 100% { transform: scale(1); opacity: 0.6; }
    50%      { transform: scale(1.08); opacity: 0.9; }
  }
  .intro-logo {
    width: 24rem;
    height: 10rem;
    z-index: 1;
  }
  .tagline {
    margin: 0;
    font-family: 'Caveat', cursive;
    font-size: 1.5rem;
    color: var(--bloom-ink-700);
    z-index: 1;
  }
  .status {
    position: absolute;
    bottom: 1.5rem;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.5rem 1rem;
    background: var(--bloom-glass);
    backdrop-filter: blur(0.75rem);
    border-radius: 999px;
    font-family: 'Poppins', system-ui, sans-serif;
    font-size: 0.75rem;
    color: var(--bloom-ink-700);
    box-shadow: 0 0.5rem 1.5rem rgba(255, 143, 188, 0.2);
  }
  .dot {
    width: 0.5rem; height: 0.5rem; border-radius: 50%;
    background: var(--bloom-mint-500);
    box-shadow: 0 0 0 0.25rem rgba(168, 230, 207, 0.4);
    animation: blink 1.6s ease-in-out infinite;
  }
  @keyframes blink {
    0%, 100% { opacity: 0.6; }
    50%      { opacity: 1; }
  }
</style>

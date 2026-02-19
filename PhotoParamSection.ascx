<%@ Control Language="C#" AutoEventWireup="true" %>

<!-- ===== PHOTO CAPTURE - PARAMETER WISE ===== -->
<div class="photo-param-section">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <span class="section-title" style="margin-bottom: 0;"><i class="bi bi-camera-fill"></i> Parameter wise photos</span>
    <span class="badge-param"><i class="bi bi-info-circle"></i> Select type → Click photo</span>
  </div>

  <!-- Parameter chips - active parameter select karo -->
  <div class="d-flex flex-wrap gap-2 mb-4">
    <div class="param-chip active" data-param="Front View" onclick="setActiveParam(this, 'Front View')">
      <i class="bi bi-car-front"></i> Front
    </div>
    <div class="param-chip" data-param="Back View" onclick="setActiveParam(this, 'Back View')">
      <i class="bi bi-car-front" style="transform: rotate(180deg);"></i> Back
    </div>
    <div class="param-chip" data-param="Left Side" onclick="setActiveParam(this, 'Left Side')">
      <i class="bi bi-arrow-left-square"></i> Left
    </div>
    <div class="param-chip" data-param="Right Side" onclick="setActiveParam(this, 'Right Side')">
      <i class="bi bi-arrow-right-square"></i> Right
    </div>
    <div class="param-chip" data-param="Interior" onclick="setActiveParam(this, 'Interior')">
      <i class="bi bi-grid"></i> Interior
    </div>
    <div class="param-chip" data-param="Engine" onclick="setActiveParam(this, 'Engine')">
      <i class="bi bi-cpu"></i> Engine
    </div>
    <div class="param-chip" data-param="Dashboard" onclick="setActiveParam(this, 'Dashboard')">
      <i class="bi bi-speedometer2"></i> Dashboard
    </div>
    <div class="param-chip" data-param="Tyres" onclick="setActiveParam(this, 'Tyres')">
      <i class="bi bi-circle"></i> Tyres
    </div>
    <div class="param-chip" data-param="Damage" onclick="setActiveParam(this, 'Damage')">
      <i class="bi bi-exclamation-triangle"></i> Damage
    </div>
  </div>

  <!-- Active parameter display and capture button -->
  <div class="d-flex align-items-center justify-content-between bg-light p-3 rounded-4 mb-2">
    <div>
      <span class="fw-bold" style="color: #0a3346;">📸 Active parameter: </span>
      <span id="activeParamLabel" class="fw-bold bg-dark text-white px-4 py-2 rounded-pill" style="background: #0f2e44 !important;">Front View</span>
    </div>
  </div>

  <!-- Camera button -->
  <button class="media-btn" id="captureParameterPhotoBtn">
    <i class="bi bi-camera-fill"></i> Capture photo for <span id="activeParamName">Front View</span>
  </button>

  <!-- Hidden file input for parameter photo -->
  <input type="file" id="paramPhotoInput" accept="image/*" capture="environment" class="hidden-input">

  <!-- Photo preview with parameter label -->
  <div id="parameterPhotoPreview" class="thumbnail-preview">
    <!-- Captured photos with parameter labels will appear here -->
  </div>
  <p class="note mt-2"><i class="bi bi-info-circle"></i> Har photo ke saath parameter save hoga. Mobile camera direct open hoga.</p>
</div>

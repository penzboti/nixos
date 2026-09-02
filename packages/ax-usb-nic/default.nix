
{ lib
, stdenv
, kernel
, kernelModuleMakeFlags
, asix-usb-nic-linux-driver
}:

stdenv.mkDerivation {
  pname = "ax-usb-nic";
  version = "unstable";

  src = asix-usb-nic-linux-driver;

  nativeBuildInputs = kernel.moduleBuildDependencies;

  postPatch = ''
    substituteInPlace ax88179_178a.c \
      --replace-fail \
        'strncpy(info->sig, AX88179_SIGNATURE, strlen(AX88179_SIGNATURE));' \
        'strscpy(info->sig, AX88179_SIGNATURE, sizeof(info->sig));'

    sed -i \
      's/strncpy(info->sig, AX88279A_SIGNATURE, strlen(AX88279A_SIGNATURE));/strscpy(info->sig, AX88279A_SIGNATURE, sizeof(info->sig));/' \
      ax88179a_772d.c

    sed -i \
      's/strncpy(info->sig, AX88179A_SIGNATURE, strlen(AX88179A_SIGNATURE));/strscpy(info->sig, AX88179A_SIGNATURE, sizeof(info->sig));/' \
      ax88179a_772d.c
  '';

  buildPhase = ''
    runHook preBuild

    make -C ${kernel.dev}/lib/modules/${kernel.modDirVersion}/build \
      M=$PWD \
      ${lib.concatStringsSep " " kernelModuleMakeFlags} \
      EXTRA_CFLAGS="-fno-pie" \
      modules

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p \
      $out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/usb

    install -Dm644 \
      ax_usb_nic.ko \
      $out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/usb/ax_usb_nic.ko

    runHook postInstall
  '';

  meta = {
    description = "ASIX AX88179B/A USB Ethernet driver";
    homepage = "https://github.com/ASIXElectronics/asix-usb-nic-linux-driver";
    license = lib.licenses.gpl2Only;
    platforms = lib.platforms.linux;
  };
}

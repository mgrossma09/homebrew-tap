class C64Emulator < Formula
  desc "Cycle-accurate Commodore 64 emulator written in Go"
  homepage "https://github.com/mgrossma09/c64-emulator-go"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mgrossma09/c64-emulator-go/releases/download/v0.0.1/c64-emulator_darwin_arm64.tar.gz"
      sha256 "1032c0fb506d0420fc46b5a6c10bf9513b9759c5d8765ca410c719442571796d"
    end
    on_intel do
      url "https://github.com/mgrossma09/c64-emulator-go/releases/download/v0.0.1/c64-emulator_darwin_x86_64.tar.gz"
      sha256 "b6340d3701a6d5e75bb2852e596862aa16ed4cd2d6261cd3a41382460eaa7f94"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mgrossma09/c64-emulator-go/releases/download/v0.0.1/c64-emulator_linux_x86_64.tar.gz"
      sha256 "3a77c8a1956e7fa3a15a8c9652ccb7028655d6e1411e4da623dcb92e2e095161"
    end
  end

  def install
    bin.install "c64-emulator"
  end

  caveats <<~EOS
    c64-emulator requires Commodore 64 ROM files (basic.rom, kernal.rom, char.rom).
    Run with:
      c64-emulator -basic /path/to/basic.rom -kernal /path/to/kernal.rom -char /path/to/char.rom
  EOS

  test do
    assert_predicate bin/"c64-emulator", :exist?
    assert_predicate bin/"c64-emulator", :executable?
  end
end

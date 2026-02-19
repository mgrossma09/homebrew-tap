class C64Emulator < Formula
  desc "Cycle-accurate Commodore 64 emulator written in Go"
  homepage "https://github.com/mgrossma09/c64-emulator-go"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mgrossma09/c64-emulator-go/releases/download/v0.0.1/c64-emulator_darwin_arm64.tar.gz"
      sha256 "7f29e07ae73aab4e98690047bf4ef7bd343e5a1d67938f5b34868d2ab4347e0b"
    end
    on_intel do
      url "https://github.com/mgrossma09/c64-emulator-go/releases/download/v0.0.1/c64-emulator_darwin_x86_64.tar.gz"
      sha256 "c6f673e88cad7f0df5eefeeabfc3ef47e3e3c8ad530380541f87a26e09819b4e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mgrossma09/c64-emulator-go/releases/download/v0.0.1/c64-emulator_linux_x86_64.tar.gz"
      sha256 "028bb33b0a8cb66db7486c0c3e668e313cb28222effaf78dff5af099b05f9019"
    end
  end

  def install
    bin.install "c64-emulator"
  end

  def caveats
    <<~EOS
      c64-emulator requires Commodore 64 ROM files (basic.rom, kernal.rom, char.rom).
      Run with:
        c64-emulator -basic /path/to/basic.rom -kernal /path/to/kernal.rom -char /path/to/char.rom
    EOS
  end

  test do
    assert_predicate bin/"c64-emulator", :exist?
    assert_predicate bin/"c64-emulator", :executable?
  end
end

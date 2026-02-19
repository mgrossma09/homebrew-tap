class C64Emulator < Formula
  desc "Cycle-accurate Commodore 64 emulator written in Go"
  homepage "https://github.com/mgrossma09/c64-emulator-go"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mgrossma09/c64-emulator-go/releases/download/v0.0.2/c64-emulator_darwin_arm64.tar.gz"
      sha256 "61681c771fa9af5d656375927ee58de8a0c011bad3b9beb6d6d52ee677b932e6"
    end
    on_intel do
      url "https://github.com/mgrossma09/c64-emulator-go/releases/download/v0.0.2/c64-emulator_darwin_x86_64.tar.gz"
      sha256 "acef985ff2167fb260f20bec560bdc9169e6b916f83518843e8e696bb32737e7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mgrossma09/c64-emulator-go/releases/download/v0.0.2/c64-emulator_linux_x86_64.tar.gz"
      sha256 "5b98d13fac500e45075c91189a0b2fd70b4f2d999e7b24a2146d19caeeaf8bb6"
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

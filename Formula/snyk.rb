class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1303.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1303.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "5b400baca637e0d2bb9fda9c24f61114a7a32b0178d707310e558f0f45da6217"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1303.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "79af72399adaca354eada7f876fc9619544c0cb69c4a31826018655a1d41090c"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1303.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "e7dcc0123c7efcf760149fd37b4b01104ae44bf7598a141e1f558571596b7f53"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1303.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "7d04b33deb020b9a1e7ba1b02106468068dd24158d55350f6a321fb1160488e6"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

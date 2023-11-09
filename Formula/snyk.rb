class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1242.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1242.0/snyk-macos"
    sha256 "d747b6a2555c71f0c97ebfa7a4fd4b8d7bb353b46e909dd9b0b7553462ec1d95"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1242.0/snyk-macos-arm64"
    sha256 "48355a159b38ed8226050f890e5003c19a618ef5156e0a79155c18a13916b1e0"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1242.0/snyk-linux"
    sha256 "93418ad612871fd27922042919df75c83837dbbf5ac2003dce4833f3f64aec03"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1242.0/snyk-linux-arm64"
    sha256 "54b387da84792711583812766f8774e247c801a2c085178997eb66bf8916f151"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

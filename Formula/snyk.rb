class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1260.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1260.0/snyk-macos"
    sha256 "f516c8a4f84189df8213f8c7941586a3626a8ccb7aa6a0ae9a90a3e26c1d0061"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1260.0/snyk-macos-arm64"
    sha256 "e2eb42db77667322c907cd9cf53a137cd518abb1aa7a92001405d102ce716634"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1260.0/snyk-linux"
    sha256 "5c8898a635628821bb0de3760fbaecb92312b8414f93d3f12bb14dea2e835b99"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1260.0/snyk-linux-arm64"
    sha256 "e087dbdaaa6c696ed58760c52fbb9a08cceaa79a14055a57a69220aa6b24b0ae"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

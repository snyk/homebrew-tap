class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1303.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1303.2/snyk-macos?utm_source=HOMEBREW"
    sha256 "69e736ea170faadf14902e3f27831b6cf67362a6d30ab07954ba1c978e9e5c42"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1303.2/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "991c4a06fb9a53d0729244f6d834b42c2634b214c2cc0645ecb1823d8b3a54ca"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1303.2/snyk-linux?utm_source=HOMEBREW"
    sha256 "d7e022a920a28a6af939ff34a27c8c58415e77cbf501fb63cf19965315b45b2b"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1303.2/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "4278cfede55594c6cf0c083ee1f0521411776145a068398e132d417e26078caa"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

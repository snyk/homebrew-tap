class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1297.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1297.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "2e46c54e82ddf30569425484590d4fc386cd6c6a11cb346fbc16998541c8f8d8"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1297.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "37389ef9dda52cb93ae24b99fdca02b546e9e42da1ea78b61428eed592b98537"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1297.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "ead3ab5fbee9f30ebf77964d54f0e860ff54dce001c236162348971e548e2172"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1297.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "13022da3bbca968ee808e52fa5741c2ca8f8696d1d9492c19e42ca26128613a7"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

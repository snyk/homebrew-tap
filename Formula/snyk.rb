class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1187.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1187.0/snyk-macos"
    sha256 "9e5d4feb0b74bf0af9cce044ae5b2790bc9c59f829bae1714db998fe288c12e0"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1187.0/snyk-linux"
    sha256 "47eef07fc719576aec4e42524131bd63cff8a6adc9c00fd386a428910287fb94"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1227.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1227.0/snyk-macos"
    sha256 "0cf2c4042fe88349e669752b936ebbcd59189dbaf2681875064d12b6ce595516"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1227.0/snyk-linux"
    sha256 "5e9f2098ebb865e710fa310edd9c31c697cdb8152651254f2a4bf91d2eb176ab"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

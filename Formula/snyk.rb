class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.305.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.305.0/snyk-macos"
    sha256 "ebc7bfef041f544c048d1316f658462778ada936b6e784a0e3cfb9097c37eb35"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.305.0/snyk-linux"
    sha256 "d53b449b79b6c756d266ef33edfe48d92968d52835bd571dd071005dd0635cd6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

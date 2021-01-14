class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.437.4"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.437.4/snyk-macos"
    sha256 "c0ce62b61ac78e0966703edfc2f28949e359da0f9b103a996d1d97c508950913"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.437.4/snyk-linux"
    sha256 "390d35a7eff9ca6df3888ea697a9089e24a7d4d1a18a69d952b05b876f83ea83"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.420.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.420.0/snyk-macos"
    sha256 "79a83fdc04518c2345de4479abf09c582a12196aa7452b39910fb0396dce4293"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.420.0/snyk-linux"
    sha256 "1e13f95c0d7cdc509df411eb61ec28c93ef4fd49f5e9a1f3f1284962d04e7cab"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.440.4"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.440.4/snyk-macos"
    sha256 "4782473cbb04a236381843811c20f703fb1bc604f27ab65a23edbdba7e412474"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.440.4/snyk-linux"
    sha256 "1282d07b1eb704647d62bc9e16c504f5e5b9ff5e19d0ad34371b114c55a6c7b5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

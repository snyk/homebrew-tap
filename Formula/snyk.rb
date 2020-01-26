class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.280.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.280.0/snyk-macos"
    sha256 "7289191b7ba1ce5118a1f2e5bb0a395e5ef9749f7d933b26d620d388ce181516"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.280.0/snyk-linux"
    sha256 "1c8fba5490432eb2b48f199bea94ec9060c9d9a930c6839728065eb760fcd092"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.713.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.713.0/snyk-macos"
    sha256 "905e0706e4647ead6a99b3756ebc837094d36cef9b1539f0a372f4b79c977ef3"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.713.0/snyk-linux"
    sha256 "9706429591326d67d55da2c0c6a9eeff2453a9f6223c16777e6a60441f7fa07b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.605.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.605.0/snyk-macos"
    sha256 "4814496fe451d9b3d2bb83306cbbdcc0b9278effa89d8cc786037d7cd4f95f36"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.605.0/snyk-linux"
    sha256 "ab4c06ceadd13eeb439a9d87de05efbfdf3e31d7bf296c54de029ff74f4631ae"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

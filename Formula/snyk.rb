class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.582.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.582.0/snyk-macos"
    sha256 "622d2340ed46e35cc557d328047037011419abd5ff0f5b82f06ffb70799659c5"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.582.0/snyk-linux"
    sha256 "bf14d821be2703e35f84f2c7aa797582c4b43c7279959bb0add2cc238fd84ed7"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

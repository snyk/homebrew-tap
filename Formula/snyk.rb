class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.278.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.278.1/snyk-macos"
    sha256 "7be3c1435eacbd13ef4e68dbccd8402dffe4f53a03063f5f80e58eea0f38d742"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.278.1/snyk-linux"
    sha256 "8f8788889ec1ab9c1da824c2357cd7d360af04985c96d874d930d22a0afc30fb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

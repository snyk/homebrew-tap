class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.422.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.422.0/snyk-macos"
    sha256 "2e2a49a557a9ee40000f51b8b6dad3613cf0249da19b5775ee5ab7b45a8e5caf"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.422.0/snyk-linux"
    sha256 "00da71f7932681997f08e107aeea9f32988c0ee4a07147c99e2e8f5705c98916"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

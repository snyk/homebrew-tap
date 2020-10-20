class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.416.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.416.0/snyk-macos"
    sha256 "1e01da2d5644e2bfabfdf4859c2efdce48761d9647b7fa9f2579e88ee294bf0f"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.416.0/snyk-linux"
    sha256 "9cd8857f64caa3029af32c2f66f1deb9b2cd8cc8db0842f6612636d73ff79173"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

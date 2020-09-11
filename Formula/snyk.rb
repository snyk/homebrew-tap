class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.393.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.393.0/snyk-macos"
    sha256 "73ed7d7e165f2bce4f2399159fb2d8f1357d50f4e98d549219658b8d7b180715"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.393.0/snyk-linux"
    sha256 "aa7eef926a1b1b03b42d9dd40dde04a498207ccd24d4dc7bef1d02096ef44372"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

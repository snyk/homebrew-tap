class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.584.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.584.0/snyk-macos"
    sha256 "7ffe5e59eba0fcab74eae51ed303a063e75a6e13c40d5d68fc71f7c635daf23f"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.584.0/snyk-linux"
    sha256 "4737fab149b91f064091e44b50eb4797f86323dbbc6b22d4b5757fb0f9643e42"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

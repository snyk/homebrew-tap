class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.309.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.309.0/snyk-macos"
    sha256 "a153b6769aabe41049a212e437859f24466c6776e6222d98b6bccbcc5e38065c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.309.0/snyk-linux"
    sha256 "8f9b19ef4ae11c3dd1dd9e27a3d4dafa5ee829f7c1cd3061c9d274e74a08a7c4"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end

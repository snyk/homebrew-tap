class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.230.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.230.2/snyk-macos"
    sha256 "d9158c023cd968f7336de8b4fe38a4669ad73379f9b688f97bd4d46236aa5dd7"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.230.2/snyk-linux"
    sha256 "c8acb82642845370f7b3b985aa5a0931d85ea8d2d0fe0edaf9db2fe89a21b1cf"
  end

  def install
    original = OS.linux? ? "snyk-linux" : "snyk-macos"
    mv original, "snyk"
    bin.install "snyk"
  end

  test do
    system "#{bin}/snyk --version"
  end
end
